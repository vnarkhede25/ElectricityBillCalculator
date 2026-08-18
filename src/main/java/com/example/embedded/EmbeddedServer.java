package com.example.embedded;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.webapp.WebAppContext;

public class EmbeddedServer {
    public static void main(String[] args) throws Exception {
        int port = 8080;
        Server server = new Server(port);

        WebAppContext context = new WebAppContext();
        context.setContextPath("/");
        // Use filesystem path to the web.xml when running from IDE/command-line
        String webappDirLocation = "src/main/webapp";
        java.io.File descriptor = new java.io.File(webappDirLocation + "/WEB-INF/web.xml");
        context.setDescriptor(descriptor.toURI().toURL().toExternalForm());
        context.setResourceBase(webappDirLocation);
        context.setParentLoaderPriority(true);

        server.setHandler(context);
        server.start();
        System.out.println("Embedded Jetty started on http://localhost:" + port);
        server.join();
    }
}
