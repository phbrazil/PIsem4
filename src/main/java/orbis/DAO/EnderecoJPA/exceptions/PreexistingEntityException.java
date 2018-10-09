package orbis.DAO.EnderecoJPA.exceptions;

import orbis.DAO.ClienteJPA.exceptions.*;

public class PreexistingEntityException extends Exception {
    public PreexistingEntityException(String message, Throwable cause) {
        super(message, cause);
    }
    public PreexistingEntityException(String message) {
        super(message);
    }
}
