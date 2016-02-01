package model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by User on 31/1/2016.
 */
@Entity
public class Question {
    private int questionId;
    private String questionDesc;
    private Integer answerId;
    private Integer levelId;
    private Integer topicId;

    @Id
    @Column(name = "question_id", nullable = false)
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    @Basic
    @Column(name = "question_desc", nullable = false, length = 500)
    public String getQuestionDesc() {
        return questionDesc;
    }

    public void setQuestionDesc(String questionDesc) {
        this.questionDesc = questionDesc;
    }

    @Basic
    @Column(name = "answer_id", nullable = true)
    public Integer getAnswerId() {
        return answerId;
    }

    public void setAnswerId(Integer answerId) {
        this.answerId = answerId;
    }

    @Basic
    @Column(name = "level_id", nullable = true)
    public Integer getLevelId() {
        return levelId;
    }

    public void setLevelId(Integer levelId) {
        this.levelId = levelId;
    }

    @Basic
    @Column(name = "topic_id", nullable = true)
    public Integer getTopicId() {
        return topicId;
    }

    public void setTopicId(Integer topicId) {
        this.topicId = topicId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Question question = (Question) o;

        if (questionId != question.questionId) return false;
        if (questionDesc != null ? !questionDesc.equals(question.questionDesc) : question.questionDesc != null)
            return false;
        if (answerId != null ? !answerId.equals(question.answerId) : question.answerId != null) return false;
        if (levelId != null ? !levelId.equals(question.levelId) : question.levelId != null) return false;
        if (topicId != null ? !topicId.equals(question.topicId) : question.topicId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = questionId;
        result = 31 * result + (questionDesc != null ? questionDesc.hashCode() : 0);
        result = 31 * result + (answerId != null ? answerId.hashCode() : 0);
        result = 31 * result + (levelId != null ? levelId.hashCode() : 0);
        result = 31 * result + (topicId != null ? topicId.hashCode() : 0);
        return result;
    }
}
