package Dao;

public class Usuario {
    private int id_usuario;
    private String usuario;
    private String correo;
    private String password;
    private String telefono;
    private String fechaNacimiento;
    private int id_estado;

    public Usuario() {
    }

    public Usuario(int id_usuario, String usuario, String correo, String password, String telefono, String fechaNacimiento, int id_estado) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.correo = correo;
        this.password = password;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.id_estado = id_estado;
    }

    public Usuario(int id_usuario, String usuario, String correo, String telefono, String fechaNacimiento, int id_estado) {
        this.id_usuario = id_usuario;
        this.usuario = usuario;
        this.correo = correo;
        this.telefono = telefono;
        this.fechaNacimiento = fechaNacimiento;
        this.id_estado = id_estado;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id_usuario=" + id_usuario + ", usuario=" + usuario + ", correo=" + correo + ", password=" + password + ", telefono=" + telefono + ", fechaNacimiento=" + fechaNacimiento + ", id_estado=" + id_estado + '}';
    }
      
}