package fileupload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/13FileUpload/Download.do")
public class Download extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String saveDirectory = getServletContext().getRealPath("/Uploads");
		String saveFilename = req.getParameter("sName");
		String originalFilename = req.getParameter("oName");

		try {
			File file = new File(saveDirectory, saveFilename);
			InputStream inStream = new FileInputStream(file);
			
			String client = req.getHeader("User-Agent");
			originalFilename = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + originalFilename + "\"");
			resp.setHeader("Content-Length", "" + file.length() );
						
			OutputStream outStream = resp.getOutputStream();
			
			byte b[] = new byte[(int)file.length()];
			int readBuffer = 0;
			while ((readBuffer = inStream.read(b)) > 0) {
				outStream.write(b, 0, readBuffer);
			}
			
			inStream.close();
			outStream.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일을 찾을 수 없습니다.");
			req.getRequestDispatcher("FileList.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일 다운로드 오류");
			req.getRequestDispatcher("FileList.jsp").forward(req, resp);
		}
	}
}
