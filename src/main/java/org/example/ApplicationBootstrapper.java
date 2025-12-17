package org.example;

import com.jcraft.jsch.JSchException;

/**
 * Handles the secure initialization and shutdown of external resources,
 * such as the SSH tunnel, before launching the main application logic.
 */
public class ApplicationBootstrapper implements AutoCloseable {

    private final SSHTunnelManager tunnelManager;
    private final int localForwardPort;

    // ---  Define all sensitive connection details here  ---
    private static final String SSH_USER = "user";
    private static final String SSH_HOST = "IP";//"192.168.86.178";
    private static final int SSH_PORT = 22;
    private static final String SSH_PASSWORD = "password";

    private static final String REMOTE_DB_HOST = "127.0.0.1";
    private static final int REMOTE_DB_PORT = 5431;
    private static final int LOCAL_FORWARD_PORT_VALUE = 5000;
    // --------------------------------------------------------

    public ApplicationBootstrapper() {
        this.localForwardPort = LOCAL_FORWARD_PORT_VALUE;
        this.tunnelManager = new SSHTunnelManager(
                SSH_HOST, SSH_USER, SSH_PASSWORD, SSH_PORT,
                REMOTE_DB_HOST, REMOTE_DB_PORT, this.localForwardPort
        );
    }

    /**
     * Establishes the SSH tunnel.
     * @throws JSchException if the connection fails.
     */
    public void startup() throws JSchException {
        System.out.println("Bootstrapper initializing...");
        tunnelManager.connect();
        System.out.println("Bootstrapper finished initialization.");
    }

    /**
     * Required by AutoCloseable. Closes the SSH tunnel.
     */
    @Override
    public void close() {
        System.out.println("Bootstrapper shutting down...");
        tunnelManager.disconnect();
    }

    public int getLocalDbPort() {
        return localForwardPort;
    }
}