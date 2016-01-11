package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by User on 28/12/2015.
 */
@Entity
public class Level {
    private int levelId;
    private String levelName;

    @Id
    @Column(name = "level_id", nullable = false)
    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }

    @Basic
    @Column(name = "level_name", nullable = true, length = 45)
    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Level level = (Level) o;

        if (levelId != level.levelId) return false;
        if (levelName != null ? !levelName.equals(level.levelName) : level.levelName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = levelId;
        result = 31 * result + (levelName != null ? levelName.hashCode() : 0);
        return result;
    }
}
