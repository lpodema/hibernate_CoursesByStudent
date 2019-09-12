package entity;
import javax.persistence.*;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;


@Entity (name="Courses")
@Table (name = "courses")
public class Courses {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "courses_seq")
    @SequenceGenerator(name = "courses_seq", sequenceName = "courses_seq")
    @Column(name = "c_id")
    private int courses_id;

    @ManyToOne(cascade = {CascadeType.ALL})
    @JoinColumn (name="course")
    private Course course;

    @Column(name = "c_init")
    private Date init= new Date();

    @Column(name = "c_end")
    private Date end = new Date();

    @Column(name = "c_schedule")
    private String schedule;

    @Column(name = "c_start")
    private LocalTime start;

    @JoinTable(name="coursesByStudent",
            joinColumns = {@JoinColumn(name="st_id", referencedColumnName = "st_id")},
            inverseJoinColumns = {@JoinColumn(name="c_id", referencedColumnName = "c_id")})
    private ArrayList <Student> students = new ArrayList<>();

    public Courses(Course course, String schedule, int a, int b) {
        this.course = course;
        this.schedule = schedule;
        this.start = LocalTime.of(a,b);
    }

    public int getCourses_id() {
        return courses_id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Date getInit() {
        return init;
    }

    public void setInit(int a, int b, int c) {
        this.init.setYear(a);
        this.init.setMonth(b);
        this.init.setDate(c);
    }

    public Date getEnd() {
        return end;
    }

    public void setEnd(int a, int b, int c) {
        this.end.setYear(a);
        this.end.setMonth(b);
        this.end.setDate(c);
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public LocalTime getStart() {
        return start;
    }

    public void setStart(int a, int b) {
        this.start = LocalTime.of(a,b);
    }

    public void addStudent(Student s){
        this.students.add(s);
    }
}

