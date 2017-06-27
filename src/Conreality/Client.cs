/* This is free and unencumbered software released into the public domain. */

using System;
using System.Data;

using Npgsql;

namespace Conreality {

  /// <summary>Conreality client.</summary>
  public class Client : IDisposable {
    private bool disposed = false;
    private NpgsqlConnection connection;

    /// <summary>Constructor.</summary>
    public Client() {
      // TODO
    }

    /// <summary></summary>
    public void Dispose() {
      this.Dispose(true);
      GC.SuppressFinalize(this);
    }

    /// <summary></summary>
    protected virtual void Dispose(bool disposing) {
      if (!this.disposed) {
        if (disposing) {
          if (this.connection != null) {
            this.connection.Dispose();
            this.connection = null;
          }
        }
        this.disposed = true;
      }
    }

    /// <summary>Destructor.</summary>
    ~Client() {
      this.Dispose(false);
    }
  }
}
