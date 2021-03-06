import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  public url: string;
  public log: any;

  constructor(
    private http: HttpClient,
  ) { }

  ngOnInit() {
    var location = window.location;
    this.url = location.protocol + '//' + location.hostname + '/server'
    this.ping()
  }

  ping() {
    this.http.get(this.url).subscribe(res => {
      console.log(res)
      this.log = res;
    }, error => {
      console.log(error)
      this.log = error;
      if (this.log['ok'] == false && this.log['url'] == "https://services.humanbrainproject.eu/oidc/login") {
        window.location.reload()
      }
    })
  }

}
