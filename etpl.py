import os
import subprocess
import json
import yaml
import plistlib

import sublime, sublime_plugin

settings = sublime.load_settings("ETPL.sublime-settings")
cwd = os.getcwd()

template_dir = os.path.join(cwd, 'template')
yaml_path = os.path.join(cwd, 'ETPL.YAML-tmLanguage')
new_plist_path = os.path.join(cwd, 'ETPL.tmLanguage')
tpl_parser_path = os.path.join(cwd, 'replacer')

template_list = os.listdir(template_dir)

def stringify(obj):
    return json.JSONEncoder().encode(obj)

def getConfig():

    conf = {}

    for key in ['commandOpen', 'commandClose', 'variableOpen', 'variableClose']:
        conf[key] = settings.get(key, key)

    return stringify(conf)

def parseYAML(text):
    try:
        data = yaml.safe_load(text)
    except Exception as e:
        print str(e)
    else:
        return data

def yaml2plist():
    file_obj = open(yaml_path)
    try:
        text = file_obj.read()
    except Exception, e:
        raise
    finally:
        file_obj.close()

    data = parseYAML(text)
    plistlib.writePlist(data, new_plist_path)

def renderTPL():
    args = ['/usr/local/bin/node', tpl_parser_path , stringify(template_list), getConfig()];

    try:
        proc = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    except Exception, e:
        print str(e)
    else:
        out, err = proc.communicate()
        if err:
            print 'Parse template error: \n' + str(err)

def onchange():
    renderTPL()
    yaml2plist()

settings.clear_on_change('ETPL');
settings.add_on_change('ETPL', onchange);

if not os.path.exists(new_plist_path):
    onchange()
