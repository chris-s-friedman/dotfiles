"""
Query entities in the dataservice
"""
import json
from ast import literal_eval

import click
from kf_utils.dataservice.scrape import (
    yield_entities_from_filter,
    yield_entities_from_kfids,
)

HOSTS = {
    "kf_dataservice_prd": "https://kf-api-dataservice.kidsfirstdrc.org",
    "kf_dataservice_qa": "https://kf-api-dataservice-qa.kidsfirstdrc.org",
}


def get_host(host_qa):
    if host_qa:
        return HOSTS.get("kf_dataservice_qa")
    else:
        return HOSTS.get("kf_dataservice_prd")


def missing_key_handler(missing_key, key_list):
    raise KeyError(f"{missing_key} not one of {key_list}")


def entity_handler(e, key=None):
    """Print entities to the terminal as requested

    :param e: entity as returned by one of the scrape functions in kf_utils
    :type e: dict
    :param key: key(s) to print to the terminal. if None, print everything
    :type key: list
    """
    if key:
        keys_to_fetch = ("kf_id",) + key
        try:
            out = {k: e[k] for k in set(keys_to_fetch)}
        except KeyError as missing_key:
            missing_key_handler(missing_key, e.keys())
    else:
        out = e
    print(json.dumps(out, indent=4))


key_option = click.option(
    "-key",
    "-k",
    multiple=True,
    type=str,
    help="Specific Keys to return from the response object.",
)


@click.group()
@click.option(
    "--host_qa", is_flag=True, help="Flag to query the qa dataservice"
)
@click.pass_context
def queries(ctx, host_qa):
    host = get_host(host_qa)
    ctx.ensure_object(dict)
    ctx.obj["host"] = host
    pass


@queries.command("kf_id")
@click.argument("kf_id", type=str)
@key_option
@click.pass_context
def run_kf_id_query(ctx, kf_id, key):
    """
    Query the given host for the given kf_id
    """
    host = ctx.obj["host"]
    for e in yield_entities_from_kfids(host, [kf_id], show_progress=False):
        entity_handler(e, key)


@queries.command("filter")
@click.argument("endpoint", type=str)
@click.argument("filter", type=str)
@key_option
@click.pass_context
def run_filter_query(ctx, endpoint, filter, key):
    """
    Query the given host using the given filter
    """
    host = ctx.obj["host"]
    filter_dict = literal_eval(filter)
    for e in yield_entities_from_filter(
        host, endpoint, filter_dict, show_progress=False
    ):
        entity_handler(e, key)


if __name__ == "__main__":
    queries()
