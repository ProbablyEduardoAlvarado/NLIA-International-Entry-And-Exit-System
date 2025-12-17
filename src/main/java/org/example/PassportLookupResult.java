package org.example;

/**
 * @param personId  null if not found
 * @param givenName null if not found
 * @param surname   null if not found
 * @param dob       null if not found
 * @param aNumber   null if not found
 * @param issueDate null if not found
 * @param expDate   null if not found
 */
public record PassportLookupResult(boolean found, String passportNumber, String countryCode, Integer personId,
                                   String givenName, String surname, String dob, String aNumber, String issueDate,
                                   String expDate) {
}
