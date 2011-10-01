Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This was an experiment for notifying the users
when something is said with Server-Sent Event / EventSource.

For the moment, I won't use it because:

- the current board daemon works
- I was hoping to simplify largely its logic, but it's not the case
- Goliath can't listen on UNIX socket
- EventSource is not supported by most browsers
  and I'm not very confident in the polyfills for it


See also
--------

* [Git repository](http://github.com/nono/board-see-LinuxFr.org)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
