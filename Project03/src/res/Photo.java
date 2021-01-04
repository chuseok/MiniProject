package res;

public class Photo {
	private String pictureNo;
	private String pictureName;
	public Photo() {

	}
	
	public String getPictureNo() {
		return pictureNo;
	}

	public void setPictureNo(String pictureNo) {
		this.pictureNo = pictureNo;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public Photo(String nom, String picture) {
		this.pictureNo = nom;
		this.pictureName = picture;
	}
}