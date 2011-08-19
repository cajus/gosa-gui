#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os
import re
import polib

def main():
    # Get mode
    parent_path, plugin = os.path.split(os.getcwd())
    if not parent_path.endswith(os.path.sep + "plugins"):
        raise IOError("needs to be called in plugin directory")

    print "Inspecting plugin %s" % plugin
    po = polib.pofile('locale/%s.po' % plugin)
    for entry in po:

        # Load and inspect files
        for occurrence, line in entry.occurrences:
            data = open(occurrence, 'r').read()

            # Template with {t} tags?
            if occurrence.endswith(".tpl"):
                data = re.sub(re.compile(r'({t})(%s)({/t})' % re.escape(entry.msgid), re.M), r'{td}\2{/td}', data)

            # PHP file with _(....) syntax
            if occurrence.endswith(".inc"):
                data = re.sub(re.compile(r'[^_](_\(["\'])(%s)(["\']\))' % re.escape(entry.msgid), re.M), r'_\1\2\3', data)

            # Assign changes and write back
            with open(occurrence, 'w') as f:
                f.write(data)

            #TODO: plural

#        print entry.__dict__
#
#    {'comment': '', 'previous_msgctxt': None, 'msgstr': u'', 'encoding':
#            'utf-8', 'msgid': u'Trigger all host commands', 'tcomment': '',
#            'msgid_plural': '', '_multiline_str': {}, 'obsolete': 0,
#            'msgstr_plural': {}, 'occurrences':
#            [(u'src/nagiosPlugin/class_nagiosAccount.inc', u'303')], 'msgctxt':
#            None, 'flags': [], 'previous_msgid': None, 'previous_msgid_plural':
#            None}


if __name__ == '__main__':
    main()
