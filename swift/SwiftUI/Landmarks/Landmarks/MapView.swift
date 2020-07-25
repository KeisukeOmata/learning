import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        //緯度と経度を設定
        let coordinate = CLLocationCoordinate2D(
                            latitude: 34.011286,
                            longitude: -116.166868
                        )
        //地図の拡大状態の設定
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        //上記2つをregionに渡す
        let region = MKCoordinateRegion(center: coordinate, span: span)
        //regionをuiViewに渡す
        uiView.setRegion(region, animated: true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
