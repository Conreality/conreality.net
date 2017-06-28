/* This is free and unencumbered software released into the public domain. */

using System;

namespace Conreality {

  /// <summary>Conreality object.</summary>
  public class Object {
    /// <summary>The object's UUID.</summary>
    protected Guid uuid;

    /// <summary>Constructor.</summary>
    public Object(string uuidString) {
      this.uuid = new Guid(uuidString);
    }

    /// <summary></summary>
    public Guid GetUUID() {
      return this.uuid;
    }

    /// <summary></summary>
    public string GetUUIDString() {
      return this.uuid.ToString();
    }
  }
}
