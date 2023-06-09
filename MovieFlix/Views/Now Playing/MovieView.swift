//
//  ContentView.swift
//  MovieFlix
//
//  Created by Kabir Dhillon on 5/18/23.
//

import SwiftUI
import Combine

struct MovieView: View {
    @StateObject var movieViewModel = MovieViewModel()
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(movieViewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w185" + movie.poster_path))
                        }
                    }
                    
                }
                .navigationTitle("Now Playing")
                .onAppear {
                    movieViewModel.fetchMovies()
                }
                .padding(.horizontal)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
