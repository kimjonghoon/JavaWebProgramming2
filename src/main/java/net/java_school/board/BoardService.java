package net.java_school.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;

public interface BoardService {
	
    //게시판
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public Board getBoard(String boardCd);

    //게시판 목록
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public List<Board> getBoards();

    //게시판 생성
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public void createBoard(Board board);

    //게시판 수정
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public void editBoard(Board board);

    //목록
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public List<Article> getArticleList(HashMap<String, String> hashmap);

    //총 레코드 수
    public int getTotalRecord(String boardCd, String searchWord);

    //글쓰기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public int addArticle(Article article);

    //첨부파일 추가
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public void addAttachFile(AttachFile attachFile);

    //글수정
    @PreAuthorize("hasRole('ADMIN') or #article.email == principal.username")
    public void modifyArticle(@P("article") Article article);

    //글삭제
    @PreAuthorize("hasRole('ADMIN') or #article.email == principal.username")
    public void removeArticle(@P("article") Article article);

    //조회수 증가
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public void increaseHit(Integer articleNo, String ip, String yearMonthDayHour);

    //상세보기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public Article getArticle(int articleNo);

    //다음글
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public Article getNextArticle(int articleNo,
            String boardCd, String searchWord);

    //이전글
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public Article getPrevArticle(int articleNo,
            String boardCd, String searchWord);

    //첨부파일 리스트
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public List<AttachFile> getAttachFileList(int articleNo);

    //첨부파일 삭제
    @PreAuthorize("#attachFile.email == principal.username or hasRole('ADMIN')")
    public void removeAttachFile(@P("attachFile") AttachFile attachFile);

    //댓글 쓰기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public void addComment(Comment comment);

    //댓글 수정
    @PreAuthorize("#comment.email == principal.username or hasRole('ADMIN')")
    public void modifyComment(@P("comment") Comment comment);

    //댓글 삭제
    @PreAuthorize("#comment.email == principal.username or hasRole('ADMIN')")
    public void removeComment(@P("comment") Comment comment);

    //댓글 리스트
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public List<Comment> getCommentList(int articleNo);

    //첨부파일 찾기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public AttachFile getAttachFile(int attachFileNo);

    //댓글 찾기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public Comment getComment(int commentNo);

    //조회수 for 상세보기
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public int getTotalViews(int articleNo);
}