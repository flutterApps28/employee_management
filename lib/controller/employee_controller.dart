import 'package:employee_management/data/service/ApiService.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model_view/Employee_model.dart';

class EmployeeController extends GetxController {
  var employees = <EmployeeModel>[].obs;
  var isLoading = true.obs; 
  var searchText = ''.obs; 

  @override
  void onInit() {
    super.onInit();
    fetchEmployees();
  }

  Future<void> fetchEmployees() async {
  try {
    isLoading(true);
    final response = await http.get(Uri.parse(ApiService.empUrl));
    if (response.statusCode == 200) {
      employees.value = employeeModelFromJson(response.body);
    } else {
      Get.snackbar('Error', 'Failed to load employees: ${response.reasonPhrase}');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to load employees: $e');
  } finally {
    isLoading(false);
  }
}

  List<EmployeeModel> get filteredEmployees {
    if (searchText.value.isEmpty) {
      return employees;
    } else {
      return employees
          .where((employee) => employee.id.contains(searchText.value))
          .toList();
    }
  }
}
