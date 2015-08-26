import os
import sys
import subprocess
import plistlib
import re

import sublime, sublime_plugin

settings = None

cwd = os.path.dirname(__file__)

PLUGIN_NAME = 'ETPL'
template_dir = os.path.join(cwd, 'template')
yaml_path = os.path.join(cwd, 'ETPL.YAML-tmLanguage')
new_plist_path = os.path.join(cwd, 'ETPL.tmLanguage')
libpath = os.path.join(cwd, 'Lib')

template_list = os.listdir(template_dir)

p = re.compile(r'\#\{([^\}]*)\}')

def add(path):
    if not path in sys.path:
        sys.path.append(path)
        print("[%s] Added %s to sys.path." % (PLUGIN_NAME, path))

# Make sublime_lib (and more) available for all packages.
add(libpath)
# Differentiate between Python 2 and Python 3 packages (split by folder)
add(os.path.join(libpath, "_py%d" % sys.version_info[0]))

# Must add Lib path first
import yaml

def getConfig():

    conf = {}

    for key in ['commandOpen', 'commandClose', 'variableOpen', 'variableClose']:
        conf[key] = settings.get(key, key)

    return conf

def parseYAML(text):
    # try:
    data = yaml.safe_load(text)
    # except Exception as e:
    #     print e
    # else:
    return data

def yaml2plist():
    file_obj = open(yaml_path)
    text = file_obj.read()
    file_obj.close()

    data = parseYAML(text)
    plistlib.writePlist(data, new_plist_path)

def read_file(source_path):
    file_obj = open(source_path)
    text = file_obj.read()
    file_obj.close()
    return text

def write_file(target_path, text):
    file_obj = open(target_path, 'w')
    file_obj.writelines(text)
    file_obj.close()

def render(source_path, target_path):

    escape = False
    if source_path.lower().find('yaml') > -1:
        escape = True

    def replace(m):
        if escape:
            return re.escape(conf[m.group(1)])

        return conf[m.group(1)]

    text = read_file(source_path)

    text = p.sub(replace, text)

    write_file(target_path, text)

def get_new_file_name(file_name):
    return os.path.splitext(file_name)[0];

def renderTPL():
    for file_name in template_list:
        source_path = os.path.join(cwd, 'template', file_name)
        target_path = os.path.join(cwd, get_new_file_name(file_name))
        render(source_path, target_path)

def onchange():
    global conf
    conf = getConfig()
    renderTPL()
    yaml2plist()

# st3 will auto call function plugin_load, but st2 won't
def plugin_loaded():

    global settings
    settings = sublime.load_settings("ETPL.sublime-settings")

    settings.clear_on_change('ETPL');
    settings.add_on_change('ETPL', onchange);

    if not os.path.exists(yaml_path):
        onchange()

    print('[%s] plugin_loaded' % (PLUGIN_NAME))

if sys.version.split('.')[0] == '2':
    plugin_loaded()

