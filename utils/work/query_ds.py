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
@click.pass_context
def run_kf_id_query(ctx, kf_id):
    """
    Query the given host for the given kf_id
    """
    host = ctx.obj["host"]
    for e in yield_entities_from_kfids(host, [kf_id], show_progress=False):
        print(json.dumps(e, indent=4))


@queries.command("filter")
@click.argument("endpoint", type=str)
@click.argument("filter", type=str)
@click.pass_context
def run_filter_query(ctx, endpoint, filter):
    """
    Query the given host using the given filter
    """
    host = ctx.obj["host"]
    filter_dict = literal_eval(filter)
    for e in yield_entities_from_filter(
        host, endpoint, filter_dict, show_progress=False
    ):
        print(json.dumps(e, indent=4))


if __name__ == "__main__":
    # run_query(kf_id, host_qa)
    queries()
