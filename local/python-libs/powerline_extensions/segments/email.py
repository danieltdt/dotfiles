import os

from powerline.segments.common import EmailIMAPSegment
from powerline.lib.threaded import with_docstring
from collections import namedtuple

_IMAPKey = namedtuple('Key', 'username password server port folder')
class SecureEmailIMAPSegment(EmailIMAPSegment):
	@staticmethod
	def key(username = '', password = '', server='imap.gmail.com', port=993, folder='INBOX', **kwargs):
          username = os.getenv("PL_EMAIL_SEGMENT_USERNAME", '')
          password = os.getenv("PL_EMAIL_SEGMENT_PASSWORD", '')

          return _IMAPKey(username, password, server, port, folder)

secure_email_imap_alert = with_docstring(SecureEmailIMAPSegment(),
'''Return unread e-mail count for IMAP servers.

:param str username:
	login username (defaults to $PL_EMAIL_SEGMENT_USERNAME)
:param str password:
	login password (defaults to $PL_EMAIL_SEGMENT_PASSWORD)
:param str server:
	e-mail server
:param int port:
	e-mail server port
:param str folder:
	folder to check for e-mails
:param int max_msgs:
	Maximum number of messages. If there are more messages then max_msgs then it
	will use gradient level equal to 100, otherwise gradient level is equal to
	``100 * msgs_num / max_msgs``. If not present gradient is not computed.

Highlight groups used: ``email_alert_gradient`` (gradient), ``email_alert``.
''')

