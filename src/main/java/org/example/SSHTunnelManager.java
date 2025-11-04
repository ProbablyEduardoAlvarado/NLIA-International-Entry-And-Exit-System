package org.example;/*
 * @Author Eduardo Alvarado
 *
 *
 *
 * */

/*
 * This will produce the SSH tunnel for the program to connect to the database server
 * This will be encapsulated in a private session
 * */

import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import java.util.Properties;

/**
 * A class to encapsulate SSH tunnel management.
 */
public class SSHTunnelManager {
    private Session session;
    private final String sshHost;
    private final String sshUser;
    private final String sshPassword;
    private final int sshPort;
    private final String remoteTargetHost;
    private final int remoteTargetPort;
    private final int localForwardPort;

    /**
     * Constructor for the tunnel manager.
     */
    public SSHTunnelManager(String sshHost, String sshUser, String sshPassword, int sshPort,
                            String remoteTargetHost, int remoteTargetPort, int localForwardPort) {
        this.sshHost = sshHost;
        this.sshUser = sshUser;
        this.sshPassword = sshPassword;
        this.sshPort = sshPort;
        this.remoteTargetHost = remoteTargetHost;
        this.remoteTargetPort = remoteTargetPort;
        this.localForwardPort = localForwardPort;
    }

    /**
     * Establishes the SSH connection and port forwarding.
     */
    public void connect() throws JSchException {
        JSch jsch = new JSch();
        // Optional: Add an identity for key-based authentication
        // jsch.addIdentity("~/.ssh/id_rsa");

        session = jsch.getSession(sshUser, sshHost, sshPort);
        session.setPassword(sshPassword);

        // Configure session properties
        Properties config = new Properties();
        // WARNING: Insecure, for development only. Use key-based authentication
        // and proper host key checking in production.
        config.put("StrictHostKeyChecking", "no");
        session.setConfig(config);

        System.out.println("Attempting to connect to SSH host " + sshHost + " on port " + sshPort + "...");
        session.connect();
        System.out.println("SSH connection established.");

        // Set up local port forwarding: localPort -> remoteTargetHost:remoteTargetPort
        session.setPortForwardingL(localForwardPort, remoteTargetHost, remoteTargetPort);
        System.out.println("Local port forwarding established: " +
                "localhost:" + localForwardPort + " -> " +
                remoteTargetHost + ":" + remoteTargetPort);
    }

    /**
     * Disconnects the SSH session and stops port forwarding.
     */
    public void disconnect() {
        if (session != null && session.isConnected()) {
            System.out.println("Disconnecting SSH session.");
            session.disconnect();
            System.out.println("SSH session disconnected.");
        }
    }
}