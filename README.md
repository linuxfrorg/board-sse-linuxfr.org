Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This daemon notifies the users when something
is said with Server-Sent Event / EventSource.


How to use it?
--------------

    $ gem install board-linuxfr
    $ mkdir board-linuxfr && cd board-linuxfr
    $ board-linuxfr -d -a board.sock -P board.pid -l board.log -e prod


See also
--------

* [Git repository](http://github.com/nono/board-see-LinuxFr.org)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
