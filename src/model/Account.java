package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by User on 31/1/2016.
 */
@Entity
public class Account {
    private int accountId;

    @Id
    @Column(name = "account_id", nullable = false)
    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    private String accountUsername;

    @Basic
    @Column(name = "account_username", nullable = false, length = 120)
    public String getAccountUsername() {
        return accountUsername;
    }

    public void setAccountUsername(String accountUsername) {
        this.accountUsername = accountUsername;
    }

    private String accountPassword;

    @Basic
    @Column(name = "account_password", nullable = false, length = 120)
    public String getAccountPassword() {
        return accountPassword;
    }

    public void setAccountPassword(String accountPassword) {
        this.accountPassword = accountPassword;
    }    private Integer teamId;

    @Basic
    @Column(name = "team_id", nullable = true)
    public Integer getTeamId() {
        return teamId;
    }

    public void setTeamId(Integer teamId) {
        this.teamId = teamId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Account account = (Account) o;

        if (accountId != account.accountId) return false;
        if (accountUsername != null ? !accountUsername.equals(account.accountUsername) : account.accountUsername != null)
            return false;
        if (accountPassword != null ? !accountPassword.equals(account.accountPassword) : account.accountPassword != null)
            return false;
        if (teamId != null ? !teamId.equals(account.teamId) : account.teamId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = accountId;
        result = 31 * result + (accountUsername != null ? accountUsername.hashCode() : 0);
        result = 31 * result + (accountPassword != null ? accountPassword.hashCode() : 0);
        result = 31 * result + (teamId != null ? teamId.hashCode() : 0);
        return result;
    }
}
