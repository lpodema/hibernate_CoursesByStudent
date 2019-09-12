package entity;
import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;


@Entity (name="Course")
@Table (name = "course")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "course_seq")
    @SequenceGenerator(name = "course_seq", sequenceName = "course_seq")
    @Column(name = "course_id")
    private int course_id;

    @Column(name = "course_name")
    private String name;

    @Column(name = "course_description")
    private String course_description;

    @ManyToMany(cascade = {CascadeType.MERGE})
    @JoinTable(name="classByCourse",
            joinColumns = {@JoinColumn(name="course_id", referencedColumnName = "course_id")},
            inverseJoinColumns = {@JoinColumn(name="cl_id", referencedColumnName = "cl_id")})
    private Set<ClassInfo> course_classes = new HashSet<>();



    public Course(int course_id, String name, String course_description, Set<ClassInfo> course_classes) {
        this.course_id = course_id;
        this.name = name;
        this.course_description = course_description;
        this.course_classes = course_classes;
    }

    public int getCourse_id() {
        return course_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCourse_description() {
        return course_description;
    }

    public void setCourse_description(String course_description) {
        this.course_description = course_description;
    }

    public Set<ClassInfo> getCourse_classes() {
        return course_classes;
    }

    public void setCourse_classes(Set<ClassInfo> course_classes) {
        this.course_classes = course_classes;
    }
}