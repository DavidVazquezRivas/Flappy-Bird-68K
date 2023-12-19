import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.imageio.ImageIO;

public class CloudsConverter {

    // Número de nubes
    private static final int n = 8;

    // Tamaño de cada bloque de pixeles
    private static final int blockSize = 4;

    // Paleta de colores
    private static final Color WHITE = new Color(251, 253, 254);
    private static final Color BLUE = new Color(128, 191, 255);
    private static final Color GRAY = new Color (220, 220, 220);
    private static final Color[] COLORS = {WHITE, GRAY, BLUE};

    // Método para calcular la distancia entre dos colores en el espacio RGB
    private static double colorDistance(Color color1, Color color2) {
        return Math.sqrt(Math.pow(color2.getRed() - color1.getRed(), 2) + Math.pow(color2.getGreen() - color1.getGreen(), 2) + Math.pow(color2.getBlue() - color1.getBlue(), 2));
    }

    // Método para comparar con los colores predefinidos y elegir el más cercano
    private static Color chooseColor(Color color, Color[] colors) {
        int index = -1;
        double minDistance = Double.MAX_VALUE;
        for (int i = 0; i < colors.length; i++) {
            double distance = colorDistance(color, colors[i]);
            if (distance < minDistance) {
                minDistance = distance;
                index = i;
            }
        }
        return colors[index];
    }

    // Método para formatear un color para el lenguaje ensamblador 68000 (00BBGGRR)
    private static String formatColor(Color color) {
        return "00" + String.format("%02X", color.getBlue()) + String.format("%02X", color.getGreen()) + String.format("%02X", color.getRed());
    }

    // Método para obtener el color predominante en un bloque 
    private static Color getDominantColor(BufferedImage image, int startX, int startY) {
        int red = 0, green = 0, blue = 0;
        int totalPixels = 0;

        for (int y = startY; y < startY + blockSize && y < image.getHeight(); y++) {
            for (int x = startX; x < startX + blockSize && x < image.getWidth(); x++) {
                Color c = new Color(image.getRGB(x, y));
                red += c.getRed();
                green += c.getGreen();
                blue += c.getBlue();
                totalPixels++;
            }
        }

        red /= totalPixels;
        green /= totalPixels;
        blue /= totalPixels;

        return new Color(red, green, blue);
    }

    public static void main(String[] args) {
        try {
            // Obtener la ruta del directorio donde está el proyecto
            String projectDirectory = System.getProperty("user.dir");

            // Crear la ruta completa para el archivo de salida .X68 en la carpeta DATA
            String outputFile = projectDirectory + File.separator + ".." + File.separator + "DATA" + File.separator + "CLOUDSDATA.X68";

            BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(outputFile));

            // Escribir cabecera del archivo
            
            bufferedWriter.write("; =============================================================================\n" + 
                                 "; THIS FILE HAS BEEN GENERATED BY CLOUDSCONVERTER.JAVA FROM CLOUD IMAGES.\n" +
                                 "; TO IMPROVE PERFORMANCE, EACH BLOCK ACTS LIKE A PIXEL, BUT IT'S ACTUALLY A \n" +
                                 ";" + blockSize + "x" + blockSize + " SQUARE. IMAGES ARE ADDAPTED TO IMAGE.X68 DRAWING.\n" + 
                                 "; =============================================================================\n\n\n" + 
                                 "; -----------------------------------------------------------------------------\n" + 
                                 "; EVERY CLOUD DATA STORES:\n" + 
                                 "; ONE WORD TO STORE THE CLOUD WIDTH IN BLOCKS.\n" + 
                                 "; TWO LONGS PAIRS STORING A COLOR AND THE AMMOUNT OF BLOCKS WITH THE SAME COLOR\n" + 
                                 "; IN A ROW.\n; EVERY IMAGE ENDS WITH A FLAG $FFFFFFFF\n" + 
                                 "; -----------------------------------------------------------------------------\n\n");

            for (int i = 0; i < n; i++) {
                String nombre = "cloud" + i;
                // Cargar la imagen desde un archivo
                BufferedImage image = ImageIO.read(new File("IMG" + File.separator + nombre + ".png"));

                // Obtener dimensiones de la imagen
                int width = image.getWidth();
                int height = image.getHeight();

                // Escribir ancho de la imagen en el archivo .X68
                bufferedWriter.write(nombre.toUpperCase() + "W\t\tDC.W\t" + width + "\n");
                bufferedWriter.write(nombre.toUpperCase() + "\n");

                // Recorrer cada píxel para generar los datos
                Color currentColor = new Color(0);
                int blockCount = 0;
                boolean firstZero = true;

                for (int y = 0; y < height; y += blockSize) {
                    for (int x = 0; x < width; x += blockSize) {
                        Color c = getDominantColor(image, x, y);

                        // Comparar el color actual con el anterior utilizando la distancia euclidiana
                        Color choosenColor = chooseColor(c, COLORS);
                        
                        if (!choosenColor.equals(currentColor) || blockCount == 65535) {
                            if (firstZero) {
                                firstZero = false;
                            } 
                            // Guardar la pareja de longs en el archivo .X68
                            else bufferedWriter.write("\t\t\tDC.L\t$" + formatColor(currentColor) + "," + blockCount + "\n");
                            currentColor = choosenColor;
                            blockCount = 1;
                        } else {
                            blockCount++;
                        }
                    }
                }

                // Guardar el último conjunto de datos si es necesario
                bufferedWriter.write("\t\t\tDC.L\t$" + formatColor(currentColor) + "," + blockCount + "\n");

                // Escribir marcador de finalización de imagen
                bufferedWriter.write("\t\t\tDC.L\t$FFFFFFFF\n\n\n");
            }

            // Cerrar el flujo de salida
            bufferedWriter.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
