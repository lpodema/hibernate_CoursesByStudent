package entity;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity (name="ClassInfo")
@Table (name = "classInfo")
public class ClassInfo {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "class_seq")
    @SequenceGenerator(name = "class_seq", sequenceName = "class_seq")
    @Column(name = "cl_id")
    private int class_id;

    @Column(name = "cl_name")
    private String name;

    @Column(name = "cl_description")
    private String class_description;

    @Column(name = "cl_topic")
    private String topic;

    @ManyToMany (mappedBy = "courses")
    private Set<Courses> courses = new HashSet<Courses>();

    public ClassInfo(String name, String class_description, String topic, Set<Courses> courses) {
        this.name = name;
        this.class_description = class_description;
        this.topic = topic;
        this.courses = courses;
    }

    public int getClass_id() {
        return class_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClass_description() {
        return class_description;
    }

    public void setClass_description(String class_description) {
        this.class_description = class_description;
    }

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public Set<Courses> getCourses() {
        return courses;
    }

    public void setCourses(Set<Courses> courses) {
        this.courses = courses;
    }

    @Override
    @ManyToMany(mappedBy="phones")
    public String toString() {
        return "ClassInfo{" +
                "class_id=" + class_id +
                ", name='" + name + '\'' +
                ", class_description='" + class_description + '\'' +
                ", topic='" + topic + '\'' +
                ", courses=" + courses +
                '}';
    }
}