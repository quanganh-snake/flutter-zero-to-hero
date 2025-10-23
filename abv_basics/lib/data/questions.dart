import 'package:abv_basics/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    text: 'Thành phố đẹp nhất ở Việt Nam?',
    answers: ['Đà Nẵng', 'Hội An', 'Hà Nội', 'TP. Hồ Chí Minh'],
  ),
  QuizQuestion(
    text: 'Môn thể thao nào được gọi là vua của các môn thể thao?',
    answers: ['Bóng đá', 'Bóng rổ', 'Quần vợt', 'Cầu lông'],
  ),
  QuizQuestion(
    text: 'Ngôn ngữ lập trình nào phổ biến nhất hiện nay?',
    answers: ['Python', 'JavaScript', 'Dart', 'Java'],
  ),
  QuizQuestion(
    text: 'Thư viện lập trình nào phổ biến nhất cho lập trình web?',
    answers: ['React', 'Angular', 'Vue', 'Svelte'],
  ),
  QuizQuestion(
    text: "Mục đích của StatefulWidget là gì?",
    answers: [
      "Quản lý trạng thái có thể thay đổi trong ứng dụng Flutter",
      "Tạo giao diện người dùng tĩnh",
      "Tối ưu hóa hiệu suất ứng dụng",
      "Xử lý các tác vụ nền",
    ],
  ),
];
