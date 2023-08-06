from datetime import datetime, timezone, timedelta

TEMPLATE = """\
---
layout: post
title:  "{0}"
date:   {1}
categories: {2}
---

"""

if __name__ == "__main__":

    title = input("Title:\n")
    categories = input("Categories:\n")

    timestamp = datetime.now(timezone(timedelta(hours=-7))).strftime("%Y-%m-%d %H:%M:%S %z")
    datestamp = datetime.today().strftime("%Y-%m-%d")

    file_name = "_posts/" + datestamp + "-" + "-".join(title.split(" ")) + ".markdown"

    with open(file_name, "w+") as file:
        file.write(TEMPLATE.format(title, timestamp, categories))