import javax.swing.JOptionPane;

public class Mensaje {
    public static void main(String[] args) {
        if (args.length == 0) {
            JOptionPane.showMessageDialog(null, "No se proporcionó ningún mensaje");
            return;
        }

        if (args[0].equals("input")) {
            String mensaje = (args.length > 1) ? args[1] : "Ingrese un valor:";
            String input = JOptionPane.showInputDialog(null, mensaje);

            // Si el usuario presiona "Cancelar" o deja el campo vacío, devuelve "0"
            if (input == null || input.trim().isEmpty()) {
                System.out.println("0");
            } else {
                System.out.println(input);
            }
        } else {
            JOptionPane.showMessageDialog(null, args[0]);
        }
    }
}
