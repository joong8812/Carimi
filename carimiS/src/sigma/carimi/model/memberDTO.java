package sigma.carimi.model;
public class memberDTO {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private String sex;
	private String local;
	private String location;
	private String job;
	private int auth;
	
	public memberDTO(String id, String pwd, String name, int age, String sex, String local, String location, String job,
			String email, String fav1, String fav2, String fav3, String fav4, String fav5, String fav6, String mycard1,
			String mycard2, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
		this.sex = sex;
		this.local = local;
		this.location = location;
		this.job = job;
		this.email = email;
		this.fav1 = fav1;
		this.fav2 = fav2;
		this.fav3 = fav3;
		this.fav4 = fav4;
		this.fav5 = fav5;
		this.fav6 = fav6;
		this.mycard1 = mycard1;
		this.mycard2 = mycard2;
		this.auth = auth;
	}

	private String email;
	private String fav1;
	private String fav2;
	private String fav3;
	private String fav4;
	private String fav5;
	private String fav6;
	private String mycard1;
	private String mycard2;
	
	public memberDTO(){
		
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFav1() {
		return fav1;
	}

	public void setFav1(String fav1) {
		this.fav1 = fav1;
	}

	public String getFav2() {
		return fav2;
	}

	public void setFav2(String fav2) {
		this.fav2 = fav2;
	}

	public String getFav3() {
		return fav3;
	}

	public void setFav3(String fav3) {
		this.fav3 = fav3;
	}

	public String getFav4() {
		return fav4;
	}

	public void setFav4(String fav4) {
		this.fav4 = fav4;
	}

	public String getFav5() {
		return fav5;
	}

	public void setFav5(String fav5) {
		this.fav5 = fav5;
	}

	public String getFav6() {
		return fav6;
	}

	public void setFav6(String fav6) {
		this.fav6 = fav6;
	}

	public String getMycard1() {
		return mycard1;
	}

	public void setMycard1(String mycard1) {
		this.mycard1 = mycard1;
	}

	public String getMycard2() {
		return mycard2;
	}

	public void setMycard2(String mycard2) {
		this.mycard2 = mycard2;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", sex=" + sex + ", local="
				+ local + ", location=" + location + ", job=" + job + ", email=" + email + ", fav1=" + fav1 + ", fav2="
				+ fav2 + ", fav3=" + fav3 + ", fav4=" + fav4 + ", fav5=" + fav5 + ", fav6=" + fav6 + ", mycard1="
				+ mycard1 + ", mycard2=" + mycard2 + "]";
	}
}