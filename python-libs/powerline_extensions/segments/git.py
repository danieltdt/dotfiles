# coding=utf-8
from __future__ import absolute_import

import os
import sys
import subprocess

from powerline.lib.vcs.git import get_branch_name
from powerline.theme import requires_segment_info

def _better_status(repo, git): # It's better for me, ok?
  untracked_flag, dirty_flag, index_flag = '', '', ''
  from pprint import pprint as p

  # pygit2 doesn't support this
  #  GIT_STATUS_WT_TYPECHANGE
  #  GIT_STATUS_INDEX_RENAMED
  #  GIT_STATUS_INDEX_TYPECHANGE

  untracked_bit = git.GIT_STATUS_WT_NEW
  dirty_bit = (git.GIT_STATUS_WT_MODIFIED | git.GIT_STATUS_WT_DELETED)
  index_bit = (git.GIT_STATUS_INDEX_NEW | git.GIT_STATUS_INDEX_MODIFIED | git.GIT_STATUS_INDEX_DELETED)
  ignored_bit = git.GIT_STATUS_IGNORED

  for fp, status in repo.status().items():
    if status & ignored_bit: continue

    untracked_flag = '%' if status & untracked_bit else untracked_flag
    dirty_flag     = '*' if status & dirty_bit else dirty_flag
    index_flag     = '+' if status & index_bit else index_flag

  return untracked_flag + dirty_flag + index_flag

def _upstream(repo):
  commits = _cmd_output(repo, ['git', 'rev-list', '--left-right', '@{u}...HEAD']).split()

  behind, ahead = '', ''
  for commit in commits:
    behind = u' ↓' if commit[0] == '<' else behind
    ahead  = u' ↑' if commit[0] == '>' else ahead

  return '%s%s' % (behind, ahead)

def _stash(repo):
  return '' if _cmd_output(repo, ['git', 'rev-parse', '--verify', 'refs/stash']).strip()  == '' else '$'

@requires_segment_info
def git_status(pl, segment_info):
  ''' Shows git branch and repo status (extracted from __git_ps1)
  Requires pygit2!
  '''
  try:
    import pygit2 as git

    try:
      repo = git.Repository(segment_info['getcwd']()+'/.git')
    except KeyError:
      pass
    else:
      if repo is not None:
        merging = 'MERGE' if os.path.isfile(repo.path+'/MERGE_HEAD') else ''
        rebasing = 'REBASE' if os.path.isdir(repo.path+'/rebase-merge') else ''
        cherry_picking = 'CHERRY-PICKING' if os.path.isfile(repo.path+'/CHERRY_PICK_HEAD') else ''
        bisecting = 'BISECTING' if os.path.isfile(repo.path+'/BISECT_LOG') else ''
        bare = 'BARE' if repo.is_bare else ''

        branch   = get_branch_name(os.path.abspath(repo.path+'..'))
        status   = _better_status(repo, git)
        stash    = _stash(repo)
        upstream = _upstream(repo) if branch != '[DETACHED HEAD]' else ''

        return [{
          'contents': branch + ' ' + status + stash + upstream,
          'highlight_group': 'branch',
        }]
  except ImportError:
    return [{
      'contents': 'install pygit2',
      'highlight_group': 'branch',
    }]

'''
Goes to repo dir, gets command output, then comes back
'''
def _cmd_output(repo, cmd):
  try:
    current = os.getcwd()
    os.chdir(repo.path)

    with open(os.devnull, 'w') as fnull:
      ret = subprocess.check_output(cmd, fnull)

    os.chdir(current)

    return ret
  except:
    return ''
