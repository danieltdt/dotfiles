from __future__ import absolute_import

import os
import sys

from powerline.lib.vcs import guess, tree_status
from powerline.theme import requires_segment_info

@requires_segment_info
def git_status(pl, segment_info):
	'''Return the current git repo's status.
	'''
	name = segment_info['getcwd']()
	repo = guess(path=name)
	if repo is not None:
		return [{
			'contents': repo.status(),
                        'highlight_group': 'branch',
		}]

