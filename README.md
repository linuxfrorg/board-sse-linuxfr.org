Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This Ruby daemon notifies the users
when something is said with Server-Sent Event / EventSource.


How to use it?
--------------

Install it with `gem install board-linuxfr`.
Then, you can launch it on local with `board-linuxfr -S /tmp/board.sock`
and it will listen on a UNIX socket at `/tmp/board.sock`.


See also
--------

* [Git repository](https://github.com/linuxfrorg/board-sse-LinuxFr.org)
* [Rubygems page](https://rubygems.org/gems/board-linuxfr)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
