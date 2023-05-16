import json
from os import path
from .path import qtile_path

config_path = path.join(qtile_path, "config.json")

if not path.isfile(config_path):
    raise Exception("Configuration file does not exist")

with open(config_path) as f:
    theme = json.load(f)["theme"]

theme_path = path.join(qtile_path, "themes", theme)

if not path.isfile(theme_path):
    raise Exception("Theme file does not exist")

with open(theme_path) as f:
    colors = json.load(f)
