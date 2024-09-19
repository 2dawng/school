using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Lab1.Models
{
    public class Student
    {
        public int Id { get; set; }

        [StringLength(100, MinimumLength = 4, ErrorMessage = "Họ và tên phải từ 4 đến 100 ký tự")]
        [Required(ErrorMessage = "Tên không được để trống")]
        [DisplayName("Họ và tên")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "Email không được để trống")]
        [RegularExpression(@"[A-Za-z0-9._%+-]+@gmail\.com$", ErrorMessage = "Địa chỉ email phải có đuôi @gmail.com")]
        public string? Email { get; set; }

        [StringLength(100, MinimumLength = 8, ErrorMessage = "Mật khẩu phải từ 8 ký tự trở lên")]
        [Required(ErrorMessage = "Mật khẩu không được để trống")]
        [RegularExpression(@"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$",
        ErrorMessage = "Mật khẩu phải có ít nhất một chữ cái viết thường, một chữ cái viết hoa, một chữ số và một ký tự đặc biệt @$!%*?&")]
        public string? Password { get; set; }

        [Required]
        public Branch Branch { get; set; }

        [Required]
        public Gender Gender { get; set; }

        public bool isRegular { get; set; }

        [DataType(DataType.MultilineText)]
        [Required(ErrorMessage = "Địa chỉ không được để trống")]
        public string? Address { get; set; }

        [Required(ErrorMessage = "Ngày sinh không được để trống")]
        [Range(typeof(DateTime), "1/1/1963", "31/12/2005", ErrorMessage = "Ngày sinh không hợp lệ")]
        [DataType(DataType.Date)]
        [DisplayName("Ngày sinh")]
        public DateTime? DateOfBirth { get; set; }

        [Required(ErrorMessage = "Điểm không được để trống")]
        [Range(0.0, 10.0, ErrorMessage = "Điểm phải nằm trong khoảng từ 0.0 đến 10.0")]
        [DisplayName("Điểm")]
        public float Score { get; set; }
    }
}
