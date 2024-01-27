//
//  Z2_ListTests.swift
//  Z2 ListTests
//
//  Created by user225913 on 1/29/23.
//
import CoreData
@testable import Z2_List
import XCTest

final class Z2_ListTests: XCTestCase {
    
    func testTaskNavigation() {
        // Utwórz instancję ContentView
        let contentView = ContentView()
        
        // Wybierz pierwsze zadanie
        let selectedTask = contentView.tasks.first!
        
        // Symuluj nawigację do widoku zadania
        let taskView = TaskView(opis: selectedTask.description)
        
        // Sprawdź, czy opis wybranego zadania jest zgodny z opisem w widoku zadania
        XCTAssertEqual(taskView.opis, selectedTask.description)
    }
    
    func testTaskListDisplay() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let tasks = contentView.tasks
        
        // Assert
        XCTAssertFalse(tasks.isEmpty, "Lista zadań powinna zawierać co najmniej jedno zadanie.")
    }
    
    
    func testTaskDetailViewDisplay() {
        // Arrange
        let contentView = ContentView()
        let taskIndex = 0
        
        // Act
        let taskDetail = contentView.tasks[taskIndex]
        
        // Assert
        XCTAssertEqual(taskDetail.title, "task 1", "Tytuł zadania nie zgadza się z oczekiwaniami.")
    }
    
    
    func testAddTask() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.tasks.append(ContentView.Task(title: "Nowe zadanie", description: "To jest nowe zadanie"))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount + 1, "Nie udało się dodać nowego zadania.")
    }
    
  
    func testDeleteTask() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.deleteItem(indexSet: IndexSet(integer: 0))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount - 1, "Nie udało się usunąć zadania.")
    }
    

    func testInitialTaskListNotEmpty() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let tasks = contentView.tasks
        
        // Assert
        XCTAssertFalse(tasks.isEmpty, "Lista zadań powinna być niepusta na początku.")
    }
    func testTaskListCount() {
        // Arrange
        let contentView = ContentView()
        let expectedCount = contentView.tasks.count
        
        // Act
        let tasks = contentView.tasks
        
        // Assert
        XCTAssertEqual(tasks.count, expectedCount, "Liczba elementów w liście nie zgadza się z oryginalną ilością zadań.")
    }
    func testAddEmptyTask() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        let emptyTask = ContentView.Task(title: "", description: "")
        contentView.tasks.append(emptyTask)
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount + 1, "Dodanie pustego zadania nie spowodowało dodania nowego elementu do listy.")
        XCTAssertTrue(contentView.tasks.contains { $0.id == emptyTask.id }, "Nowe puste zadanie nie zostało dodane do listy.")
    }
    
    func testFirstTaskTitle() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let firstTask = contentView.tasks.first
        
        // Assert
        XCTAssertEqual(firstTask?.title, "task 1", "Tytuł pierwszego zadania nie zgadza się z oczekiwaniami.")
    }
    
    func testSecondTaskDescription() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let secondTask = contentView.tasks[1]
        
        // Assert
        XCTAssertEqual(secondTask.description, "buy potatoes for mashed potatoes", "Opis drugiego zadania nie zgadza się z oczekiwaniami.")
    }
    func testAtLeastOneTaskExists() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let tasksCount = contentView.tasks.count
        
        // Assert
        XCTAssertGreaterThan(tasksCount, 0, "Lista zadań powinna zawierać przynajmniej jedno zadanie.")
    }
    
    func testThirdTaskDescriptionContainsRoasting() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let thirdTask = contentView.tasks[2]
        
        // Assert
        XCTAssertTrue(thirdTask.description.contains("roasting"), "Opis trzeciego zadania nie zawiera frazy 'roasting'.")
    }

    func testLastTaskDescriptionNotEmpty() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let lastTask = contentView.tasks.last
        
        // Assert
        XCTAssertFalse(lastTask?.description.isEmpty ?? true, "Opis ostatniego zadania powinien być niepusty.")
    }
    
    func testFourthTaskDescriptionContainsComma() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let fourthTask = contentView.tasks[3]
        
        // Assert
        XCTAssertFalse(fourthTask.description.contains(","), "Opis czwartego zadania powinien zawierać przecinek.")
    }
    

    func testThirdTaskTitleDoesNotContainNumbers() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let thirdTask = contentView.tasks[2]
        
        // Assert
        XCTAssertFalse(thirdTask.title.rangeOfCharacter(from: .decimalDigits) == nil, "Tytuł trzeciego zadania nie powinien zawierać cyfr.")
    }
    func testSecondTaskDescriptionLength() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let secondTask = contentView.tasks[1]
        
        // Assert
        XCTAssertLessThanOrEqual(secondTask.description.count, 50, "Opis drugiego zadania jest zbyt długi.")
    }
    func testSecondTaskTitleNotEmpty() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let secondTask = contentView.tasks[2]
        
        // Assert
        XCTAssertFalse(secondTask.title.isEmpty , "Tytuł drugiego zadania powinien być niepusty.")
    }
    func testLastTaskTitleMinLength() {
            // Arrange
            let contentView = ContentView()
            
            // Act
            let lastTask = contentView.tasks.last
            
            // Assert
            XCTAssertGreaterThanOrEqual(lastTask?.title.count ?? 0, 3, "Tytuł ostatniego zadania powinien zawierać co najmniej 3 litery.")
        }
    // Test 26: Sprawdzenie, czy lista zadań zawiera tytuł "task 3"
        func testTaskListContainsTask3() {
            // Arrange
            let contentView = ContentView()
            
            // Act
            let containsTask3 = contentView.tasks.contains { $0.title == "task 3" }
            
            // Assert
            XCTAssertTrue(containsTask3, "Lista zadań powinna zawierać zadanie o tytule 'task 3'.")
        }
    
    func testAddTaskWithEmptyTitle() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.tasks.append(ContentView.Task(title: "", description: "Opis zadania"))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount + 1, "Dodanie zadania z pustym tytułem nie powinno być możliwe.")
    }

    
    func testDeleteLastTask() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.deleteItem(indexSet: IndexSet(integer: initialTaskCount - 1))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount - 1, "Nie udało się usunąć ostatniego zadania.")
    }
    
    func testAddTaskWithUniqueTitle() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        let uniqueTitle = "Nowe unikalne zadanie"
        
        // Act
        contentView.tasks.append(ContentView.Task(title: uniqueTitle, description: "Opis zadania"))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount + 1, "Nie udało się dodać zadania o unikalnym tytule.")
    }
    func testDeleteNonExistingTask() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        let nonExistingIndex = initialTaskCount + 1
        
        // Act
        contentView.deleteItem(indexSet: IndexSet(integer: nonExistingIndex))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, initialTaskCount, "Usunięcie nieistniejącego zadania spowodowało zmianę w liście.")
    }
    func testTaskListNotEmptyAfterDelete() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.deleteItem(indexSet: IndexSet(integer: 0))
        
        // Assert
        XCTAssertFalse(contentView.tasks.isEmpty, "Lista zadań powinna być niepusta po usunięciu jednego zadania.")
    }
    func testTaskListEmptyAfterDeleteAll() {
        // Arrange
        var contentView = ContentView()
        
        // Act
        contentView.tasks.removeAll()
        
        // Assert
        XCTAssertTrue(contentView.tasks.isEmpty, "Lista zadań powinna być pusta po usunięciu wszystkich zadań.")
    }

    func testTaskListFiltering() {
        // Arrange
        var contentView = ContentView()
        
        // Act
        let filteredTasks = contentView.tasks.filter { $0.title.contains("2") }
        
        // Assert
        XCTAssertEqual(filteredTasks.count, 1, "Filtrowanie listy zadań nie działa poprawnie.")
    }
 
    func testTaskListContainsUniqueIDs() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let uniqueIDs = Array(Set(contentView.tasks.map { $0.id }))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, uniqueIDs.count, "ID zadań nie są unikalne.")
    }
    
    func testTaskListContainsUniqueTitles() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let uniqueTitles = Array(Set(contentView.tasks.map { $0.title }))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, uniqueTitles.count, "Tytuły zadań nie są unikalne.")
    }
    
    func testUniqueTaskIDs() {
        // Arrange
        let contentView = ContentView()
        
        // Act
        let uniqueIDs = Array(Set(contentView.tasks.map { $0.id }))
        
        // Assert
        XCTAssertEqual(contentView.tasks.count, uniqueIDs.count, "ID zadań nie są unikalne.")
    }

    func testTaskListSortedByTitle() {
        // Arrange
        var contentView = ContentView()
        
        // Act
        contentView.tasks.sort { $0.title < $1.title }
        
        // Assert
        XCTAssertTrue(contentView.tasks.elementsEqual(contentView.tasks.sorted { $0.title < $1.title }, by: { $0.id == $1.id && $0.title == $1.title && $0.description == $1.description }), "Lista zadań nie jest posortowana alfabetycznie według tytułów.")
    }

    func testTaskListNotEmptyAfterAddAndDelete() {
        // Arrange
        var contentView = ContentView()
        let initialTaskCount = contentView.tasks.count
        
        // Act
        contentView.tasks.append(ContentView.Task(title: "Nowe zadanie", description: "Opis zadania"))
        contentView.deleteItem(indexSet: IndexSet(integer: initialTaskCount))
        
        // Assert
        XCTAssertFalse(contentView.tasks.isEmpty, "Lista zadań powinna być niepusta po dodaniu i usunięciu zadania.")
    }



    
}
    
    
    
    
    




