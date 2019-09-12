package entity;
import javax.persistence.*;


@Entity (name="Province")
@Table (name = "province")
public class Province {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "province_seq")
    @SequenceGenerator(name = "province_seq", sequenceName = "province_seq")
    @Column(name = "pr_id")
    private short id;

    @Column(name = "pr_name")
    private String name;

    public Province(short id, String name) {
        this.id = id;
        this.name = name;
    }

    public short getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}