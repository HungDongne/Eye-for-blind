import cv2
import time
import os
from datetime import datetime

# Tạo thư mục để lưu ảnh nếu chưa tồn tại
output_folder = "webcam_captures"
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

# Mở camera (0 là camera mặc định)
cap = cv2.VideoCapture(0)

# Kiểm tra xem camera có mở được không
if not cap.isOpened():
    print("Không thể mở camera. Vui lòng kiểm tra lại.")
    exit()

print("Đang chụp ảnh từ webcam. Nhấn 'q' để thoát.")

try:
    while True:
        # Đọc frame từ camera
        ret, frame = cap.read()
        
        # Kiểm tra xem frame có được đọc đúng không
        if not ret:
            print("Không thể đọc frame từ camera. Thoát...")
            break
        
        # Hiển thị frame
        cv2.imshow('Camera', frame)
        
        # Tạo tên file với timestamp
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"{output_folder}/capture_{timestamp}.jpg"
        
        # Lưu frame thành file jpg
        cv2.imwrite(filename, frame)
        print(f"Đã lưu: {filename}")
        
        # Kiểm tra nếu nhấn phím 'q' thì thoát
        if cv2.waitKey(1) == ord('q'):
            break
            
        # Chờ 3 giây trước khi chụp ảnh tiếp theo
        time.sleep(3)
        
finally:
    # Giải phóng tài nguyên
    cap.release()
    cv2.destroyAllWindows()
    print("Đã dừng chụp ảnh và đóng camera.")