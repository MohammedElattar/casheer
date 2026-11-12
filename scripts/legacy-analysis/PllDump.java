// Oracle Forms 12c JDAPI PLL body extractor.
// Compile:  javac -cp "<OH>/jlib/frmjdapi.jar" PllDump.java
// Run:      java -cp ".;<OH>/jlib/frmjdapi.jar" PllDump <in.pll> <out.txt>
// Depends on PlsqlModule (12c JDAPI; LibraryModule removed).
import oracle.forms.jdapi.*;
import java.io.*;
import java.lang.reflect.*;

public class PllDump {
  static String tg(Object o, String m) {
    try { Method x = o.getClass().getMethod(m); Object r = x.invoke(o); return r == null ? null : r.toString(); }
    catch (Throwable e) { return null; }
  }
  public static void main(String[] a) throws Exception {
    if (a.length < 2) { System.err.println("usage: PllDump <input.pll> <out.txt>"); System.exit(2); }
    PrintStream out = new PrintStream(new FileOutputStream(a[1]), true, "UTF-8");
    Jdapi.setFailLibraryLoad(false);
    Jdapi.setFailSubclassLoad(false);
    PlsqlModule lib = PlsqlModule.open(a[0]);
    out.println("=== LIBRARY " + lib.getName() + " ===");
    out.println("FILE: " + a[0]);
    JdapiIterator pui = lib.getProgramUnits();
    int n = 0;
    while (pui.hasNext()) {
      ProgramUnit pu = (ProgramUnit) pui.next();
      String name = pu.getName();
      String kind = tg(pu, "getProgramUnitType");
      String text = null;
      try { text = pu.getProgramUnitText(); } catch (Throwable e) { text = "<<ERROR: " + e + ">>"; }
      out.println();
      out.println("--- PU #" + (++n) + " name=" + name + " kind=" + kind + " ---");
      if (text != null) out.println(text);
    }
    out.println();
    out.println("=== END count=" + n + " ===");
    out.close();
    lib.destroy();
    Jdapi.shutdown();
  }
}
