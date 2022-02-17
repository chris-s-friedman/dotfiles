"""
Query entities in the dataservice
"""
import json

import click
from kf_utils.dataservice.scrape import yield_entities_from_kfids


@click.command()
@click.argument("kf_id", type=str)
@click.argument("host", default="https://kf-api-dataservice.kidsfirstdrc.org")
def query(host, kf_id):
    """
    Query the given host for the given kf_id
    """
    for e in yield_entities_from_kfids(host, [kf_id], show_progress=False):
        print(json.dumps(e, indent=4))


if __name__ == "__main__":
    query()
