import SwiftUI

struct CameraView: View {
    var body: some View {
        VStack {
            Text("Camera")
                .font(.largeTitle)
            // We'll implement camera functionality later
        }
        .navigationTitle("Camera")
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}