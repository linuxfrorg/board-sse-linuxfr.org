Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This Ruby daemon notifies the users
when something is said with Server-Sent Event / EventSource.


How to use it?
--------------

You can nstall the gem with `gem install board-sse-linuxfr.org`.

Then, you can launch it on local with `board-sse-linuxfr.org -S /tmp/board.sock`
and it will listen on a UNIX socket at `/tmp/board.sock`.

Another way is to use a container engine (like Docker or Podman) and a
composer (like the Docker compose plugin or the podman-compose utility)
to build and setup a service.


See also
--------

* [Git repository](https://github.com/linuxfrorg/board-sse-LinuxFr.org)
* For versions >= 1.0.0: [Rubygems board-sse-linuxfr.org](https://rubygems.org/gems/board-sse-linuxfr.org)
* For older version: [old Rubygems board-linuxfr](https://rubygems.org/gems/board-linuxfr)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
