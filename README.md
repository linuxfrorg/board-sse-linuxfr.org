Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This is an experiment for notifying the users
when something is said with Server-Sent Event / EventSource.

For the moment, there are some difficulties:

- I was hoping to simplify largely its logic, but it's not the case
  → maybe, it will be better if I also refactor code in the Rails part
- Goliath can't listen on UNIX socket
  → it's no longer the case (fixed in the git repository)
- EventSource is not supported by most browsers
  → I need to try the polyfills


TODO
----

* Add comments
* ./bin/board-linuxfr -svS ../board.sock


See also
--------

* [Git repository](http://github.com/nono/board-sse-LinuxFr.org)
* [Current board](https://github.com/nono/Board-LinuxFr.org)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
