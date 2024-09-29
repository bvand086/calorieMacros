import SwiftUI
import AVFoundation

struct CameraView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var mealViewModel: MealViewModel
    @State private var image: UIImage?
    @State private var showingImagePicker = false
    @State private var showingConfirmation = false

    var body: some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                
                Button("Confirm and Analyze") {
                    showingConfirmation = true
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else {
                Button("Take Photo") {
                    showingImagePicker = true
                }
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $image)
        }
        .alert(isPresented: $showingConfirmation) {
            Alert(
                title: Text("Confirm Analysis"),
                message: Text("Do you want to analyze this meal image?"),
                primaryButton: .default(Text("Analyze")) {
                    analyzeImage()
                },
                secondaryButton: .cancel()
            )
        }
    }

    private func analyzeImage() {
        guard let image = image else { return }
        let newMeal = Meal(name: "Analyzed Meal", image: image)
        mealViewModel.addMealAndAnalyze(newMeal, image: image)
        presentationMode.wrappedValue.dismiss()
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) private var presentationMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .camera
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
            .environmentObject(MealViewModel())
    }
}