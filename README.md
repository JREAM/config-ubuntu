# Config Ubuntu

This is being simplied and rewrtten for Ubuntu Jammy.
You can look at old tags or commits for the old documents and files.

There are better approaches to install scripts such as writing your own in one file for a one time automation.
You could use a docker ubuntu jammy container to continually retest your setup if you went that route. This little toolkit
is just for fun.

I am aware of the many Node, Go, Python, and so on CLI helper tools but I don't want to use helpers or frameworks for every
single thing I write. Especially on non-critical projects. This is just a little "break" piece of code for me to get my mind
of the mundane stuff sometimes. Not that I'm boasting of any impressive skill here,  it's just nice to tinker here and there.

I know you can use Docker to install containerized version as well but my goal is not to do this. I don't think you should
use docker for everything, especially for someone who just wants a simple setup on they linux box. Containerization will come
in time for them. You can fork this and make it better if you find it useful.

I'll update this to some better bash features when its there, shorten some scripts, and make it simpler.
Sometimes I post to a little blog on [JREAM](https://jream.com) if you are interested in nerd lingo.

- @TODO
  - webservers - to combine apache/nginx (maybe
  - php - to combine any php version
  - hashicorp - combined all packages w/APT key they now have (Just Test It)
  - log file results in `OUTPUT.LOG` so it all doesn't go missing on the screen
  - add some colors
  - Missing server.sh, redo it
  - Combine into one menu, not separate files, ./install.sh or similar
  - Dont forget to use exports.sh
- Jesse
