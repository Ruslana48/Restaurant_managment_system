package exceptions;

/**
 * Custom not checked exception
 * Used for displaying error page on website
 */
public class AppExceptions extends RuntimeException {
    public AppExceptions() {
    }

    public AppExceptions(String message) {
        super(message);
    }

    public AppExceptions(String message, Throwable cause) {
        super(message, cause);
    }

    public AppExceptions(Throwable cause) {
        super(cause);
    }

    public AppExceptions(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}