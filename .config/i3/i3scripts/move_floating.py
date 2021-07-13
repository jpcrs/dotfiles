#!/usr/bin/env python3
import i3ipc
from pprint import pprint

def repeat_to_length(string_to_expand, length):
    return (string_to_expand * (int(length/len(string_to_expand))+1))[:length]

i3 = i3ipc.Connection()
ws = i3.get_tree().find_focused().workspace()
current_workspace = ws.name;
new_workspace = ws.name[0]+str(00)+":"
new_workspace_index = ws.name[0]+str(00);
print(ws.name)
print(new_workspace)
print(len(i3.get_tree().find_focused().workspace().floating_nodes) > 0)
if (len(i3.get_tree().find_focused().workspace().floating_nodes) > 0):
    i3.command('[workspace="%s" floating] move to workspace "%s"' % (current_workspace, new_workspace))
else:
    i3.command('[workspace="%s" floating] move to workspace "%s"' % (new_workspace_index, current_workspace))
    i3.command('focus floating')
