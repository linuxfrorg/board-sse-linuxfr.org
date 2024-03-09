Board for LinuxFr.org
=====================

Users of the LinuxFr.org website can chat on a space called the board
(« la tribune » in french). This Ruby daemon notifies the users
when something is said with Server-Sent Event / EventSource.


How to use it?
--------------

You can nstall the gem with `gem install board-linuxfr` [using the linuxfrorg
Github Package Registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-rubygems-registry#installing-a-package).
Then, you can launch it on local with `board-linuxfr -S /tmp/board.sock`
and it will listen on a UNIX socket at `/tmp/board.sock`.

Another way is to use a container engine (like Docker or Podman) and a
composer (like the Docker compose plugin or the podman-compose utility)
to build and setup a service.


See also
--------

* [Git repository](https://github.com/linuxfrorg/board-sse-LinuxFr.org)
* For versions >= 0.1.4: [Github Package repostory](https://github.com/linuxfrorg/board-sse-linuxfr.org/pkgs/rubygems/board-linuxfr)
* For older version: [Rubygems page](https://rubygems.org/gems/board-linuxfr)


Copyright
---------

The code is licensed as GNU AGPLv3. See the LICENSE file for the full license.

♡2011 by Bruno Michel. Copying is an act of love. Please copy and share.
