# GAWK web server restarting every client request

# actions before reading text stream
BEGIN {
  RS = ORS = "\r\n"

  # bind the port 8080
  HttpService = "/inet/tcp/8080/0/0"

  # prepare the data
  msg = sprintf("Hello, world, cnt=%d, hostname=%s", cnt, host)
  msg_len = length(msg) + length(ORS)
  print "HTTP/1.0 200 OK"              |& HttpService
  print "Content-Length: " msg_len ORS |& HttpService
  print msg                            |& HttpService

  # request loop
  while ((HttpService |& getline) > 0)
    continue;

  # close the socket
  close(HttpService)
}

# eof
