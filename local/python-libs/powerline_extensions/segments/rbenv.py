# coding=utf-8

import os
import subprocess
import re

from powerline.theme import requires_segment_info

def version(pl,):
  ''' Shows current ruby version from rbenv '''
  rb_version = '(no ruby)'

  try:
    with open(os.devnull, 'w') as fnull:
      rbenv_version = subprocess.check_output(['rbenv', 'version'], stderr=fnull)
    rb_version = re.split('\s', rbenv_version)[0]
  except:
    rb_version = '(rbenv version error)'

  return [{
    'contents': rb_version,
    'highlight_group': 'rbenv',
  }]
