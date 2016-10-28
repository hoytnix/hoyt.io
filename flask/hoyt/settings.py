from os import path, walk

import anyconfig


def settings(environment=None):
    if not environment:
        environment = 'develop'

    cwd = path.dirname(path.abspath(__file__))
    config_dir = path.join(cwd, 'config')

    config_files = []
    for (root, _, file_names) in walk(config_dir):
        for file_name in file_names:
            config_files.append(path.join(root, file_name))
    config_files = sorted(config_files)

    settings = {}
    for config_file in config_files:
        config = anyconfig.load(config_file)
        for key in config:
            settings[key] = config[key]

        if environment in config_file:
            break

    return settings
