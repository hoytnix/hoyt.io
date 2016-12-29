"""Because writing imports is redundant."""

import inspect


def all_models(blueprint=None, caller=None):
    """A list of model-class objects."""

    project = 'hive'
    namespace = __import__(project)

    blueprints = None
    for name, obj in inspect.getmembers(namespace):
        if inspect.ismodule(obj):
            if caller == 'auto-importer':
                print(obj)
            if "module '{}.blueprints' from".format(project) in '%r' % obj:
                blueprints = obj

    if blueprints == None:
        print('no blueprints: ' + caller)

    modules = []
    for name, obj in inspect.getmembers(blueprints):
        if inspect.ismodule(obj):
            if blueprint:
                obj_path = ('%r' % obj).split(' ')[1]
                obj_name = obj_path.split('.')[-1][:-1] # remove trailing `'`
                if blueprint == obj_name:
                    modules.append(obj)
            else:
                modules.append(obj)

    if blueprint:
        if modules.__len__() == 0:
            return None # Do not continue.

    classes = []
    for module in modules:
        for name, obj in inspect.getmembers(module):
            if inspect.isclass(obj):
                classes.append(obj)

    models = []
    for _class in classes:
        try:
            if _class.__tablename__:
                if _class not in models:  # IDK why there are duplicates.
                    models.append(_class)
        except:
            pass

    return models


def all_blueprints():
    """A list of Blueprint objects."""

    project = 'hive'
    namespace = __import__(project)

    blueprints = None
    for name, obj in inspect.getmembers(namespace):
        if inspect.ismodule(obj):
            if "module '{}.blueprints'".format(project) in '%r' % obj:
                blueprints = obj

    modules = []
    for name, obj in inspect.getmembers(blueprints):
        if inspect.ismodule(obj):
            modules.append(obj)

    blueprints = []
    for module in modules:
        for name, obj in inspect.getmembers(module):
            try:
                if obj.template_folder:
                    if obj not in blueprints:
                        blueprints.append(obj)
            except:
                pass

    return blueprints
